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
    public class salonesController : Controller
    {
        private readonly SalonesfwContext _context;

        public salonesController(SalonesfwContext context)
        {
            _context = context;
        }

        // GET: salones
        public async Task<IActionResult> Index()
        {
            return View(await _context.salones.ToListAsync());
        }

        // GET: salones/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var salones = await _context.salones
                .FirstOrDefaultAsync(m => m.id == id);
            if (salones == null)
            {
                return NotFound();
            }

            return View(salones);
        }

        // GET: salones/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: salones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,NumeroSalon,Localizacion")] salones salones)
        {
            if (ModelState.IsValid)
            {
                _context.Add(salones);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(salones);
        }

        // GET: salones/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var salones = await _context.salones.FindAsync(id);
            if (salones == null)
            {
                return NotFound();
            }
            return View(salones);
        }

        // POST: salones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("id,NumeroSalon,Localizacion")] salones salones)
        {
            if (id != salones.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(salones);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!salonesExists(salones.id))
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
            return View(salones);
        }

        // GET: salones/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var salones = await _context.salones
                .FirstOrDefaultAsync(m => m.id == id);
            if (salones == null)
            {
                return NotFound();
            }

            return View(salones);
        }

        // POST: salones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var salones = await _context.salones.FindAsync(id);
            _context.salones.Remove(salones);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool salonesExists(int id)
        {
            return _context.salones.Any(e => e.id == id);
        }
    }
}
