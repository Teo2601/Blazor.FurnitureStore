using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Salonesfw.Data;
using Salonesfw.Models;

namespace Salonesfw
{
    public class BeneficiariosController : Controller
    {
        private readonly SalonesfwContext _context;

        public BeneficiariosController(SalonesfwContext context)
        {
            _context = context;
        }

        // GET: Beneficiarios
        public async Task<IActionResult> Index()
        {
            return View(await _context.Beneficiarios.ToListAsync());
        }

        // GET: Beneficiarios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var beneficiarios = await _context.Beneficiarios
                .FirstOrDefaultAsync(m => m.id == id);
            if (beneficiarios == null)
            {
                return NotFound();
            }

            return View(beneficiarios);
        }

        // GET: Beneficiarios/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Beneficiarios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,Nombre,Apellido,Cc,idSalon")] Beneficiarios beneficiarios)
        {
            if (ModelState.IsValid)
            {
                _context.Add(beneficiarios);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(beneficiarios);
        }

        // GET: Beneficiarios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var beneficiarios = await _context.Beneficiarios.FindAsync(id);
            if (beneficiarios == null)
            {
                return NotFound();
            }
            return View(beneficiarios);
        }

        // POST: Beneficiarios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("id,Nombre,Apellido,Cc,idSalon")] Beneficiarios beneficiarios)
        {
            if (id != beneficiarios.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(beneficiarios);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BeneficiariosExists(beneficiarios.id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(beneficiarios);
        }

        // GET: Beneficiarios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var beneficiarios = await _context.Beneficiarios
                .FirstOrDefaultAsync(m => m.id == id);
            if (beneficiarios == null)
            {
                return NotFound();
            }

            return View(beneficiarios);
        }

        // POST: Beneficiarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var beneficiarios = await _context.Beneficiarios.FindAsync(id);
            _context.Beneficiarios.Remove(beneficiarios);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BeneficiariosExists(int id)
        {
            return _context.Beneficiarios.Any(e => e.id == id);
        }
    }
}
